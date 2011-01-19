package com.tillg.WellnessMeter;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.logging.Logger;

public class UserWeights {

	private static ArrayList<Weight> weights;
	private static String FILE = "weights.txt";

	public static void addWeight(Weight weight) {
		weights.add(weight);
	}

	public static void addWeight(String dateStr, String weightValueStr) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		Date date = null;
		float weightValue = 0;
		try {
			date = formatter.parse(dateStr);
			weightValue = Float.parseFloat(weightValueStr);

		} catch (Exception e) {
			//System.out.println(e.toString());
			//e.printStackTrace();
			throw new Exception("Cannot understand date '" + dateStr + "'");
		}
		addWeight(date, weightValue);
	}

	public static void addWeight(Date date, float weightValue) {
		Weight m = new Weight(date, weightValue);
		weights.add(m);
		writeToFile();
	}

	public static void writeToFile () {
		Iterator<Weight> it = weights.iterator();
		try{
			// Create file 
			FileWriter fstream = new FileWriter(FILE);
			BufferedWriter out = new BufferedWriter(fstream);
			while (it.hasNext()) {
				Weight w = it.next();
				out.write(w.toString());
				out.newLine();
			}
			out.close();
		} catch (Exception e){//Catch exception if any
			System.err.println("Error: " + e.getMessage());
		}
	}

	public static void readFromFile () {
		Logger l = java.util.logging.Logger.getAnonymousLogger();
		l.log(java.util.logging.Level.ALL,"huhu");
		weights = new ArrayList<Weight>();
		try{
			// Create file 
			FileReader fstream = new FileReader(FILE);
			BufferedReader in = new BufferedReader(fstream);
		    String inputLine;
	            while ((inputLine = in.readLine( )) != null) {
	                addWeight(Weight.fromString(inputLine));
	            }
	            in.close( );
		} catch (Exception e){//Catch exception if any
			System.err.println("Error: " + e.getMessage());
		}
	}

	private static void initWeightsWithDummy() {
		// Create & fill an array with dummy data if we don't have any weights
		// yet
		weights = new ArrayList<Weight>();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		try {
			weights.add(new Weight(formatter.parse("2010/11/12"),(float) 70.6 ));
			weights.add(new Weight(formatter.parse("2010/11/13"),(float) 72.8 ));
			weights.add(new Weight(formatter.parse("2010/11/14"),(float) 74.4 ));
			weights.add(new Weight(formatter.parse("2010/11/15"),(float) 71.5 ));
		} catch (ParseException e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
	}

	private static ArrayList<Weight> _getWeights() {
		if (weights == null)
			UserWeights.readFromFile();
		return weights;
	}

	public ArrayList<Weight> getWeights() {
		return UserWeights._getWeights();
	}

	public ArrayList<Weight> getWeightsForDisplay() {
		int NUM=5; // The no of items to display
		ArrayList<Weight> displayWeights = this.getWeights();
		Collections.sort(displayWeights);
		while (displayWeights.size() > NUM)
			displayWeights.remove(0);
		return displayWeights;
	}
}
